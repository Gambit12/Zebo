<#import "parts/common.ftl" as c>

<@c.page>
<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/main" class="form-inline">
            <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Search by tag" />
            <button type="submit" class="btn btn-primary ml-2">Найти</button>
        </form>
    </div>
</div>


<div class="card-columns">
    <#list messages as message>
        <div class="card my-3" >

        <#if message.filename??>
            <img src="/img/${message.filename}" class="card-img-top">
        </#if>
        <div class="m-2">
        <span>${message.text}</span>
        <i>${message.tag}</i>
        </div>
        <div class="card-footer text-muted">
        ${message.authorName}
        </div>
        </div>
    <#else>
        No message
    </#list>
</div>


<div id="calendar"></div>

<script type="text/javascript">
    $(function() {

        $('#calendar').fullCalendar({
            defaultView: 'agendaWeek',
            hour12:false,
            hour: '2-digit',
            minute: '2-digit',
            minTime:'09:00:00',
            maxTime:'20:00:00',

            themeSystem: 'bootstrap4',
            themeName: 'Minty',
            header: {
                left: 'prev,next today',
                center: 'addEventButton',
                right: 'month,agendaWeek,agendaDay,listMonth'
            },
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
                            start  : '2019-01-25T13:00',
                            end  : '2019-01-25T14:00',
                            allDay: false
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


<!--script type="text/javascript">
    $(function () {
        // инициализация datetimepicker7 и datetimepicker8
        $("#datetimepicker7").datetimepicker();
        $("#datetimepicker8").datetimepicker({
            useCurrent: false
        });
        $("#datetimepicker7").on("dp.change", function (e) {
            $('#datetimepicker8').data("DateTimePicker").minDate(e.date);
        });
        $("#datetimepicker8").on("dp.change", function (e) {
            $('#datetimepicker7').data("DateTimePicker").maxDate(e.date);
        });
    });
</script-->
</@c.page>