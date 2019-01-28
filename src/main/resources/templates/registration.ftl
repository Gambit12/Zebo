<#import "parts/common.ftl" as c>
<!--#import "parts/login.ftl" as l-->
<@c.page>
<div class = "mb-1">
    Registration

</div>
    <form action="/registration" method="post">
    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> Name:</label>
        <div class="col-sm-6">
            <input type="text" name="name" class="form-control" placeholder="What is your name?"/>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> Surname:</label>
        <div class="col-sm-6">
            <input type="text" name="surname" class="form-control" placeholder="What is your surname?"/>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> Phone number:</label>
        <div class="col-sm-6">
            <input type="text" name="phone_number" class="form-control" placeholder="What is your phone number?"/>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> E-mail : </label>
        <div class="col-sm-6">
            <input type="email" name="email" class="form-control" placeholder="Your email"/>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> User Name : </label>
        <div class="col-sm-6">
            <input type="text" name="username" class="form-control" placeholder="Your login"/>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> Password:</label>
        <div class="col-sm-6">
            <input type="password" name="password" class="form-control" placeholder="Your password"/>
        </div>
    </div>

    <input type="hidden" name = "_csrf" value="${_csrf.token }"/>
    <button class="btn btn-primary" type="submit">Sign up</button>

    </form>

    <style type="text/css">
        body{
            /*background-color: #3366CC; !* Цвет фона*!*/
            background-image: url('https://f.kisscc0.com/ds/78bdab8886837018e0426c101e08a592/L4Dxd3E5UME5OGg1SZH0Y4eye7r6kBNkOF5ph9V9b4KwRbO6WfExO5JmSqpqZkOxSIG4WMgzOGU2TaU5NUC2QoO9VsY2QF91htk=/kisscc0-doctor-5b39a03aa28af3.8018820415305032266658.png');

            background-repeat: no-repeat;
            background-size: contain;
        }
    </style>

${message?ifExists}
<!--@l.login "/registration" true /-->
</@c.page>