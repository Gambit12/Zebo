<#macro login> <!--login path isRegisterForm-->
    <form action="/login" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> User Name : </label>
            <div class="col-sm-6">
                <input type="text" name="username" class="form-control" placeholder="user name"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Password:</label>
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control" placeholder="password"/>
            </div>
        </div>




        <input type="hidden" name = "_csrf" value="${_csrf.token }"/>
        <a href="/registration">Not registered yet?</a>
        <button class="btn btn-primary" type="submit">Sign in</button>
    <!--input type="date" class="form-control" id="date" name="date" placeholder="Дата" required-->
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name = "_csrf" value="${_csrf.token }"/>
    <button class="btn btn-primary" type="submit">Sign In/Out</button>
    </form>

</#macro>