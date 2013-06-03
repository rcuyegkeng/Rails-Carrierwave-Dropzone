# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

  student_form = new Dropzone("#student_form", {
      paramName: "student[imagefile]"
      enqueueForUpload: false
    })

#  $('#student_form').toggleClass('dropzone') # After creating a dropzone, set the class so we get dropzone's default style.

  $("#student_form_save_button").click( ->
    console.log("Save Button Clicked")
    if student_form.files.length > 0
      console.log("found file to process")
      file = student_form.files[0]
      student_form.filesQueue.push(file);
      student_form.processQueue();
  )