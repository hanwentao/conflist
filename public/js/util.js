function loadroundcorners() 
{
  Nifty("div.roundbox");
};

function mytime() 
{
  var currentTime = new Date();
  var month = currentTime.getMonth() + 1
  var day = currentTime.getDate()
  var year = currentTime.getFullYear()
  var hour = currentTime.getHours();
  var minute = currentTime.getMinutes();
  var second = currentTime.getSeconds();

  if (second <= 9) 
    second = "0" + second;

  if (minute <= 9) 
    minute = "0" + minute;

  if (hour <= 9) 
    hour = "0" + hour;

  dispTime = year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;
  document.getElementById("localclock").innerHTML = "Local Time: " + dispTime;
  setTimeout("mytime()", 1000); 
};

window.onload = function()
{
  loadroundcorners();
  mytime();
}

function checkDelete(captcha_str, id) {
  var captcha = prompt('What is ' + captcha_str + ' ?', '');
  if (captcha != '' && captcha != null) {
    window.location.href = '/conflist/delete/' + id + '?answer=' + captcha
  }
}

function toggleAdd(id) {
  var t = document.getElementById(id);
  var btn = document.getElementById('addButton');

  if (t.style.display == 'none') {
    t.style.display = '';
    btn.innerHTML = 'Hide';
  } else {
    t.style.display = 'none';
    btn.innerHTML = 'Add';
  }

  loadroundcorners();
}

