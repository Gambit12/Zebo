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

    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Add new booking
    </a>
    <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" class="form-control" name="text" placeholder="Enter Doctor's name"/>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="tag" placeholder="Enter time" />
                </div>

                <#--<div class="form-group">-->
                    <#--<input type="text" class="form-control" name="time" placeholder="Enter time">-->
                <#--</div>-->

                <div class="form-group">
                <div class="custom-file">
                    <input type = "file" name="file" id = "customFile" />
                    <label class = "custom-file-label" for = "customFile">Add document</label>
                </div>
                </div>

                <!-- begin -->
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
        <!-- end -->

                <div class="form-group">
                    <input type="hidden" class="form-control" name="_csrf" value="${_csrf.token}" />
                </div>
                <div class="form-group">
                <button type="submit" class="btn btn-primary">Добавить</button>
                </div>
            </form>
        </div>
    </div>

    <div class="card-columns">
    <#list messages as message>
        <div class="card my-3" >

        <#if message.filename??>
            <img src="/img/${message.filename}" class="card-img-top" />
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
</@c.page>