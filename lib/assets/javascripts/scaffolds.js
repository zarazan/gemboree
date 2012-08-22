//Button loading indicator
$('.btn').attr("data-loading-text", "loading...");
$('.btn').live('click', function(e) { $(this).button('loading') });

//Change edit button to yellow on mouseover
$(".btn-edit").hover(function(e) { $(this).addClass('btn-warning'); },
function(e) { $(this).removeClass('btn-warning'); });

//Change destroy button to red on mouseover
$(".btn-destroy").hover(function(e) { $(this).addClass('btn-danger'); },
function(e) { $(this).removeClass('btn-danger'); });

//Add sort direction indicators
$('.current.asc').before('<i class="icon-arrow-up">');
$('.current.desc').before('<i class="icon-arrow-down">');
