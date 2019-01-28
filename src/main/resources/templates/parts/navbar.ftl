<#include "security.ftl">
<#import "login.ftl" as l>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Menu</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/">Calendar</a>
                </li>

            <#if !isDoctor>
            <li class="nav-item">
                <a class="nav-link" href="/doctors">Book a visit</a>
            </li>
            </#if>
            <#if isUser && !isDoctor && !isAdmin>
            <li class="nav-item">
                <a class="nav-link" href="/main">My reservations</a>
            </li>
            </#if>
            <#if isDoctor>
                <li class="nav-item">
                    <a class="nav-link" href="/main">My patients</a>
                </li>
            </#if>
            <#if isAdmin>
            <li class="nav-item">
                <a class="nav-link" href="/user/">User List</a>
            </li>
            </#if>

            <#if isDoctor>
                <li class="nav-item">
                    <a class="nav-link" href="/patientList/">Patient List</a>
                </li>
            </#if>

            <#if user??>
                <li class="nav-item">
                    <a class="nav-link" href="/user/profile">Profile</a>
                </li>
            </#if>

        </ul>
        <div class="navbar-text mr-3">${name}</div>
        <@l.logout />
    </div>
</nav>