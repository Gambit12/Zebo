<#import "parts/common.ftl" as c>

<@c.page>
    <h5>Hello, guest!</h5>
    <div>
        This is a 'Zebo' clinic management system
    </div>
    <div>
        <img src="http://www.dentalbite.com/blog/wp-content/uploads/2015/06/preguntas-dentista.jpg" class="img-fluid" alt="Dent_login">
        <div class="container">
            <div class="row">
                <div class='col-sm-6'>
                    <div class="form-group">
                        <div class='input-group date' id='datetimepicker1'>
                            <input type='text' class="form-control" />
                            <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                        </div>
                    </div>
                </div>
                <script type="text/javascript">
                    $(function () {
                        $('#datetimepicker1').datetimepicker();
                    });
                </script>
            </div>
        </div>
    </div>
</@c.page>