<% if !@parent_id.blank? %>
  $("#parent_<%= @parent_id%>").remove();
<% end %>