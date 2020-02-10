<template lang='pug'>
  #dashboardSidebar
   aside.menu
    p.menu-label Categories
    ul.menu-list
      li
        router-link(:to='{ name: "home_path" }')
          span.icon
            font-awesome-icon(icon='home')
          span Home
      li
        router-link(:to='{ name: "categories_path" }')
          span.icon
            font-awesome-icon(icon='film')
          span Category
</template>

<script>
  export default {
    name: 'dashboardSidebar'
  }
</script>
