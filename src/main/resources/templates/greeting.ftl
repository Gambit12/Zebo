<#import "parts/common.ftl" as c>

<@c.page>


    <h5>Hello, guest!</h5>
    <div>
        This is a 'Zebo' clinic management system
    </div>
<!---Datetime picker-->
    <!--input type="date" class="form-control" class="mydate" name="date" placeholder="Дата"-->
    <!---Datetime picker-->

    <!-- new -->
    <div class="row">
        <div class="col-xs-6">
            <div class="form-group">
                <div class="input-group date" id="datetimepicker7">
                    <input type="text" class="form-control"/>
                    <span class="input-group-addon">
                    <i class="glyphicon glyphicon-calendar"></i>
                </span>
                </div>
            </div>
        </div>
        <div class="col-xs-6">
            <div class="form-group">
                <div class="input-group date" id="datetimepicker8">
                    <input type="text" class="form-control"/>
                    <span class="input-group-addon">
                    <i class="glyphicon glyphicon-calendar"></i>
                </span>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
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
    </script>

    <div>
        <img src="http://www.dentalbite.com/blog/wp-content/uploads/2015/06/preguntas-dentista.jpg" class="img-fluid" alt="Dent_login" />
    </div>
</@c.page>