<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8' />
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link href='api/fullcalendar-5.11.3/lib/main.css' rel='stylesheet' />
<script src='api/fullcalendar-5.11.3/lib/main.js'></script>
<script src='api/fullcalendar-5.11.3/lib/locales/ko.js'></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
#calendar {
	width: 600px;
	height: 600px;
}
.event-icon{
	width:24px;
}
</style>
<script>

document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
      selectable: true,
      selectMirror: true,
      editable: true,
      navLinks: true,
      
      headerToolbar: {
         left: 'prev,next today',
         center: 'title',
         right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      eventContent:{
    	  html: `<div><img src="./image/event_icon.png" class="event-icon" />some html</div>`,
      },
      dateClick: function(arg) {
    	  Swal.fire({
              html: "<div class='mb-7'>Create new event?</div><div class='fw-bold mb-5'>Event Name:</div><input type='text' class='form-control' name='event_name' />",
              icon: "info",
              showCancelButton: true,
              buttonsStyling: false,
              confirmButtonText: "Yes, create it!",
              cancelButtonText: "No, return",
              customClass: {
                  confirmButton: "btn btn-primary",
                  cancelButton: "btn btn-active-light"
              }
          }).then(function (result) {
              if (result.value) {
                  var title = document.querySelector("input[name=;event_name']").value;
                  if (title) {
                      calendar.addEvent({
                          title: title,
                          start: arg.start,
                          end: arg.end,
                          allDay: arg.allDay
                      })
                  }
                  calendar.unselect()
              } else if (result.dismiss === "cancel") {
                  Swal.fire({
                      text: "Event creation was declined!.",
                      icon: "error",
                      buttonsStyling: false,
                      confirmButtonText: "Ok, got it!",
                      customClass: {
                          confirmButton: "btn btn-primary",
                      }
                  });
              }
          });
      },

      // Delete event
      eventClick: function (arg) {
          Swal.fire({
              text: "Are you sure you want to delete this event?",
              icon: "warning",
              showCancelButton: true,
              buttonsStyling: false,
              confirmButtonText: "Yes, delete it!",
              cancelButtonText: "No, return",
              customClass: {
                  confirmButton: "btn btn-primary",
                  cancelButton: "btn btn-active-light"
              }
          }).then(function (result) {
              if (result.value) {
                  arg.event.remove()
              } else if (result.dismiss === "cancel") {
                  Swal.fire({
                      text: "Event was not deleted!.",
                      icon: "error",
                      buttonsStyling: false,
                      confirmButtonText: "Ok, got it!",
                      customClass: {
                          confirmButton: "btn btn-primary",
                      }
                  });
              }
          });
      },
      dayMaxEvents: true, // allow "more" link when too many events
      // 이벤트 객체 필드 document : https://fullcalendar.io/docs/event-object
      events: [
          {
          title: 'All Day Event',
          start: '2022-11-01'
          },
          {
          title: 'Long Event',
          start: '2022-11-07',
          end: '2022-11-11'
          },
          {
          groupId: 999,
          title: 'Repeating Event',
          start: '2022-11-09T04:00:00'
          },
          {
          groupId: 999,
          title: 'Repeating Event',
          start: '2022-11-16T16:00:00'
          },
          {
          title: 'Conference',
          start: '2022-11-11',
          end: '2022-11-13'
          },
          {
          title: 'Meeting',
          start: '2022-11-12T10:30:00',
          end: '2022-11-12T12:30:00'
          },
          {
          title: 'Lunch',
          start: '2022-11-12T12:00:00'
          },
          {
          title: 'Meeting',
          start: '2022-11-12T14:30:00'
          },
          {
          title: 'Happy Hour',
          start: '2022-11-12T17:30:00'
          },
          {
          title: 'Dinner',
          start: '2022-11-12T20:00:00'
          },
          {
          title: 'Birthday Party',
          start: '2022-11-13T07:00:00'
          },
          {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2022-11-28'
          }
      ]
      
    });
    calendar.render();
  });



</script>


</head>
<body>
	<div id='calendar'></div>
	<button type="button">기록 추가</button>

</body>
</html>