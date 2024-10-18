<% if @parent_comment.blank? %>
  $("#expanded-public").html("<%= escape_javascript render('public') %>");
  $("#expanded-private").html("<%= escape_javascript render('private') %>");
  $("#discussion-form").html("<%= escape_javascript render('discussion_form') %>");
<% else %>
  $("#slide_<%= @parent_comment.id %>").html("<%= escape_javascript(render('show')) %>");
<% end %>