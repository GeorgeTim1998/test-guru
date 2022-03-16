window.onload = function() {  
  const timeField = document.getElementById('time-limit');

  if (timeField) {
    const startTime = timeField.dataset.start
    const limitTime = timeField.dataset.limit * 60
    
    setInterval(function() {
      changeRemainingTime(timeField, startTime, limitTime)
    }, 1000)
  }
}

function changeRemainingTime(timeField, startTime, limitTime) {
  const currentTime = parseInt(new Date().getTime()/1000)
  const remainingTime = limitTime - (currentTime - startTime)
  
  if (remainingTime <= 0) {
    document.forms[0].submit();
  }
  
  timeField.textContent = timeFormat(remainingTime)
}

function timeFormat(remainingTime) {
  const sec = remainingTime%60
  const min = (remainingTime - sec)/60%60
  const hour = (remainingTime - min*60 - sec)/3600

  return `${hour}:${min}:${sec}`;
}
