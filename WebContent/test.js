function section(evt, clickSection) {
  var i, sectionContent, tabs;

  sectionContent = document.getElementsByClassName("sectionContent");
  for (i = 0; i < sectionContent.length; i++) {
    sectionContent[i].style.display = "none";
  }

  tabs = document.getElementsByClassName("tabs");
  for (i = 0; i < tabs.length; i++) {
    tabs[i].className = tabs[i].className.replace("active", "");
  }

  document.getElementById(clickSection).style.display = "block";
  evt.currentTarget.className += " active";
}