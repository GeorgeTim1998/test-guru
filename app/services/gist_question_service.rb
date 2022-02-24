class GistQuestionService
  SUCCESSFUL_RESPONSE = 201

  Response = Struct.new(:success?, :url)

  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    gist_hash = @client.create_gist(gist_params)
    Response.new(success?, gist_hash[:html_url])
  end

  private

  def default_client
    Octokit::Client.new(access_token: github_access_token)
  end

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
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

  def github_access_token
    Rails.application.credentials.github_access_token
  end
end
