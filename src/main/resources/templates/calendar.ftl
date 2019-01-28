<#import "parts/common.ftl" as c>
<@c.page>
    <!--link rel='stylesheet' href='fullcalendar/fullcalendar.css' />
    <script src='fullcalendar/fullcalendar.js'></script-->

    <!--script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.0/fullcalendar.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.0/fullcalendar.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.0/fullcalendar.print.css"-->

    <style type="text/css">
        body{
            background-image: url(https://images.pexels.com/photos/1061581/pexels-photo-1061581.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260);
            background-repeat: no-repeat;
            background-size: cover;

        }
    </style>

<div id="calendar"></div>

<script type="text/javascript">
    $(function() {

        $('#calendar').fullCalendar({

            themeSystem: 'bootstrap4',
            themeName: 'Minty',
            header: {
                left: 'prev,next today',
                center: 'addEventButton',
                right: 'month,agendaWeek,agendaDay,listMonth'
            },
            fixedWeekCount: false,
            weekNumbers: true,
            eventLimit: true, // allow "more" link when too many events
            selectable: true,
            selectHelper: true,
            editable: true,
            eventLimit: true,
            events: '/events.json',

            select: function(start, end){
                $.getScript('/events/new', function () {
                    $('#event_date_range').val(moment(start).format("MM/DD/YYYY HH:mm") + ' - ' +
                        moment(end).format("MM/DD/YYYY HH:mm"))
                    date_range_picker();
                    $('.start_hidden').val(moment(start).format('YYYY-MM-DD HH:mm'));
                    $('.end_hidden').val(moment(end).format('YYYY-MM-DD HH:mm'));
                    
                });
                calendar.fullCalendar('unselect');
            },

            eventSources: [
                {

                    events: [
                        {
                            title  : 'MKawecki',
                            start  : '2019-01-25T09:00',
                            end  : '2019-01-25T10:00',
                            allDay: false
                        },
                        {
                            title  : 'Dorota Machulska',
                            start  : '2019-01-25T10:00',
                            end    : '2019-01-25T11:00',

                        },
                        {
                            title  : 'Piotr Mochnacki',
                            start  : '2019-01-25T13:00',
                            end    : '2019-01-25T14:00',
                        },


                        {
                            title  : 'usertest',
                            start  : '2019-01-26T09:00',
                            end  : '2019-01-26T10:00',
                            allDay: false
                        },
                        {
                            title  : 'Kacper Kacperowicz',
                            start  : '2019-01-26T11:00',
                            end    : '2019-01-26T12:00',

                        },
                        {
                            title  : 'Basia Basiewska',
                            start  : '2019-01-26T15:00',
                            end    : '2019-01-26T16:00',
                        }
                    ] ,

                    color: 'black',     // an option!
                    textColor: 'yellow' // an option!
                }
            ],

            customButtons: {
                addEventButton: {
                    text: 'Add new event',
                    click: function () {
                        var dateStr1 = prompt('Enter date in YYYY-MM-DD HH:mm format');
                        var dateStr2 = prompt('Enter date in YYYY-MM-DD HH:mm format');
                        var beggin = moment(dateStr1);
                        var ennd= moment(dateStr2);

                        if (beggin.isValid() && ennd.isValid()) {
                            $('#calendar').fullCalendar('renderEvent', {
                                title: 'Dynamic event',
                                start: beggin,
                                end: ennd,
                                allDay: false
                            });
                        } else {
                            alert('Invalid Date');
                        }

                    }
                }
            },

            eventDrop: function(event, delta, revertFunc) {
                event_data = {
                    event: {
                        id: event.id,
                        start: event.start.format(),
                        end: event.end.format()
                    }
                };
                $.ajax({
                    url: event.update_url,
                    data: event_data,
                    type: 'PATCH'
                });
            },

            // eventClick: function(event, jsEvent, view) {
            //     $.getScript(event.edit_url, function() {
            //         $('#event_date_range').val(moment(event.start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(event.end).format("MM/DD/YYYY HH:mm"))
            //         date_range_picker();
            //         $('.start_hidden').val(moment(event.start).format('YYYY-MM-DD HH:mm'));
            //         $('.end_hidden').val(moment(event.end).format('YYYY-MM-DD HH:mm'));
            //     });
            // }

            eventClick: function(calEvent, jsEvent, view) {

                alert('Event: ' + calEvent.title);
                alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
                alert('View: ' + view.name);

                // change the border color just for fun
                $(this).css('border-color', 'red');

            }
        });
    })

// $(document).on('turbolinks:load', initialize_calendar);
</script>
</@c.page>