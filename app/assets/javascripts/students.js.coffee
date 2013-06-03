# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

  if $('#student_form').length > 0
    student_form = new Dropzone("#student_form", {
        paramName: "student[imagefile]"
        enqueueForUpload: false
    })

    student_form.on("success", (file) ->
      console.log("successfully uploaded file")
      $('#status_message').html("<b style='color: green;'>Student Saved</b>")
    )

    student_form.on("error", (file) ->
      console.log("error occurred while uploading file")
      $('#status_message').html("<b style='color: red;'>An error occurred while saving the Student.</b>")
    )

    $("#student_form_save_button").click( ->
      console.log("Save Button Clicked")
      if student_form.files.length > 0
        console.log("found file to process")
        file = student_form.files[0]
        student_form.filesQueue.push(file);
        student_form.processQueue();
      else
        $("#student_form").submit();
    )