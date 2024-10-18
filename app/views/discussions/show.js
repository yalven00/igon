<% if !@page.blank? %>
  $("#expanded-reply").append("<%= escape_javascript(render('comment_childs')) %>");
    <% if @child_comments.total_pages == @child_comments.current_page %>
      $("#more-reply-discussions").hide();
    <% else %>
      $("#more-relpy-discussions").attr("href", "<%= community_discussions_path(:community_id => @community.id, :page => @child_comments.current_page + 1)%>");
    <% end %>
<% else %>
  $("#parent_box_<%= @parent_comment.id %>").hide();
  $("#parent_<%= @parent_comment.id %>").append("<%= escape_javascript(render('show')) %>");
<% end %>