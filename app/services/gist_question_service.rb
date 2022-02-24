class GistQuestionService
  SUCCESSFUL_RESPONSE = 201

  Response = Struct.new(:success?, :url)

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: github_access_token)
  end

  def call
    gist_hash = @client.create_gist(gist_params)
    Response.new(success?, gist_hash[:html_url])
  end

  private

  def success?
    @client.last_response.status == SUCCESSFUL_RESPONSE
  end

  def gist_params
    {
      description: I18n.t('description', title: @test.title),
      files: {
        I18n.t('file') => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

  def github_access_token
    Rails.application.credentials.github_access_token
  end
end
