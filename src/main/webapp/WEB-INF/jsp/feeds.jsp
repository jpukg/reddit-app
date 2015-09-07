<html>
<head>

<title>Schedule to Reddit</title>
<link rel="shortcut icon" type="image/png" th:href="@{/resources/favicon.png}"/>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>

</head>
<body>
<div th:include="header"/>

<div class="container">
<h1>My RSS Feeds</h1>
<br/>
<a th:href="@{/feedForm}" class="btn btn-primary">Add New RSS Feed</a>
<br/>
<br/>
<table class="table table-bordered">
<thead>
<tr>
<th>Name</th>
<th>Feed URL</th>
<th>Actions</th>
</tr>
</thead>

</table>
</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
/*<![CDATA[*/
           
$(function(){
	$.get("myFeeds", function(data){
        $.each(data, function( index, site ) {
            $('.table').append('<tr><td>'+site.name+'</td><td>'+site.url+
              '</td><td><a href="#" class="btn btn-danger" onclick="confirmDelete('+site.id+
              ') ">Delete</a> </td></tr>');
        });
    });
});

function confirmDelete(id) {
    if (confirm("Do you really want to delete this site?") == true) {
        deleteSite(id);
    } 
}

function deleteSite(id){
    $.ajax({
        url: 'myFeeds/'+id,
        type: 'DELETE',
        success: function(result) {
            window.location.href="feeds"
        }
    });
}
/*]]>*/
</script>
</body>
</html>