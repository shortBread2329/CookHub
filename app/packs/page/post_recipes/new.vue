<template>
  <div id="vue">
    <p>Congratulations</p>
    <p>{{ message }}</p>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Vue's Hello World was successful."
    }
  }
}
</script>

<style scoped>
#vue {
  font-size: 2em;
  text-align: center;
}
</style>
