<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
<div class = "mb-1">
    Registration

</div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> Phone number:</label>
        <div class="col-sm-6">
            <input type="text" name="phone_number" class="form-control" placeholder="phone number"/>
        </div>
    </div>
${message?ifExists}
<@l.login "/registration" true />
</@c.page>