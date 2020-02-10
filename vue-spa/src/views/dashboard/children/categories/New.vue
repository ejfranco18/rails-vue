<template lang='pug'>
  #categoriesNew
    form(@submit.prevent="newCategory")
      .columns
        .column.is-half.is-offset-one-quarter
          h3.title.is-uppercase Add new category
          .field
            .label Name
            .control
              input.input(v-model="category.name" placeholder="Name of the category" autofocus required)
          .field
            .label Description
            .control
              textarea.textarea(v-model="category.description" placeholder="Description of the category")

      .columns.is-multiline
        .column.is-12(v-for="(movie, index) in category.movies_attributes")
          .card
            .card-header
              .card-header-title.is-uppercase Movie
              .card-header-icon
                span.icon(@click="deleteMovieForm(index)")
                  font-awesome-icon(icon="times")
            .card-content
              .columns
                .column
                  .field
                    .label Name
                    .control
                      input.input(v-model="movie.name" placeholder="Name of the movie")
                  .field
                    .label Year
                    .control
                      input.input(v-model="movie.year" placeholder="Year of the movie")
                  .field
                    .label Ranking
                    .control
                      input.input(type="number" v-model="movie.ranking" min="1" max="5" placeholder="Ranking of the movie")
                .column
                  .field
                    .label Description
                    .control
                      textarea.textarea(v-model="movie.description" rows="7" placeholder="Description of the movie")
      .buttons
        button.button.is-success
          span.icon
            font-awesome-icon(icon="save")
          span Save
        button.button.is-link(@click.prevent="addMovieForm" style="margin-left: auto;")
          span.icon
            font-awesome-icon(icon="plus")
          span Add movie
</template>

<script>
  export default {
    name: 'categoriesNew',
    data() {
      return {
        category: {
          movies_attributes: [
          ]
        }
      }
    },
    methods: {
      newCategory() {
        this.$store.dispatch('postCategory', this.category)
          .then(response => {
            this.$router.push({ name: 'category_path', params: { id: response.data.id }})
          })
      },

      addMovieForm() {
        this.category.movies_attributes.push(
          { name: '', description: "", year: 2020, ranking: 1 }
        )
      },

      deleteMovieForm(index) {
        this.category.movies_attributes.splice(index,1)
      }
    }
  }
</script>
