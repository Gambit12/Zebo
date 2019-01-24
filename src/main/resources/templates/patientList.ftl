<#import "parts/common.ftl" as c>

<@c.page>
<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/main" class="form-inline">
            <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Search by tag">
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