<#import "parts/common.ftl" as c>

<@c.page>
    List of doctors
    <table>
    <thead>
    <tr>
        <th>Name</th>
        <th>Schedule</th>
    </tr>
    </thead>
    <tbody>

    <#list doctors as user>
    <#if user.isDoctor()>
        <tr>
        <td>${user.username}</td>
        <td><a href="${user.id}">View doctor's schedule</a></td>
        </tr>
    </#if>
    </#list>
    </tbody>
    </table>
</@c.page>