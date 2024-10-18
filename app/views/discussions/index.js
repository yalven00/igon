<% if @more_section == 'public' %>
  $("#more-public").append("<%= escape_javascript render('public') %>");
  <% if @public_discussions.total_pages == @public_discussions.current_page %>
      $("#more-public-discussions").hide();
  <% else %>
      $("#more-public-discussions").attr("href", "<%= community_discussions_path(:community_id => @community.id, :page => @public_discussions.current_page + 1, :more => 'public')%>");
  <% end %>
  <% else %>
    $("#more-private").append("<%= escape_javascript render('private') %>");
  <% if @private_discussions.total_pages == @private_discussions.current_page %>
      $("#more-private-discussions").hide();
  <% else %>
      $("#more-private-discussions").attr("href", "<%= community_discussions_path(:community_id => @community.id, :page => @public_discussions.current_page + 1, :more => 'private')%>");
  <% end %>
<% end %>