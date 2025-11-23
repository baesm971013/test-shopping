<template>
  <v-app>
    <v-app-bar app color="primary" dark>
      <v-toolbar-title>TETO SHOP</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn text>로그인</v-btn>
      <v-btn text>회원가입</v-btn>
    </v-app-bar>

    <v-main>
      <router-view />
    </v-main>
  </v-app>
</template>

<script>
export default {
  name: 'App'
}
</script>