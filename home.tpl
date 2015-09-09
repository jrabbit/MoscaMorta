<!DOCTYPE html>
<html>
<head>
<link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
<link rel="import" href="bower_components/polymer/polymer.html">
<link rel="import" href="bower_components/paper-card/paper-card.html">
<link rel="import" href="bower_components/paper-button/paper-button.html">
<link rel="import" href="bower_components/paper-badge/paper-badge.html">


<style type="text/css">
  html{
    font-family: 'Roboto', sans-serif;
  }
</style>
<style is="custom-style">
    body {
      background-color: var(--paper-grey-50);
    }
    #cards {
      @apply(--layout-vertical);
      @apply(--center-justified);
      max-width: 400px;
      margin-left: auto;
      margin-right: auto;
    }
    paper-card {
      width: 100%;
      margin-bottom: 16px;
    }
    paper-badge {
/*      --paper-badge-margin-left: 20px;
*/    }
    .avatar {
      display: inline-block;
      height: 64px;
      width: 64px;
      border-radius: 50%;
      background: var(--paper-pink-500);
      color: white;
      line-height: 64px;
      font-size: 30px;
      text-align: center;
    }
    .leaderboard {
        @apply(--layout-vertical);
        @apply(--center-justified);
    }
    .fancy .title {
      position: absolute;
      top: 30px;
      left: 100px;
      color: var(--paper-indigo-500);
    }
    .fancy img {
      width: 100%;
    }
    .fancy .big {
      font-size: 22px;
      padding: 8px 0 16px;
      color: var(--google-grey-500);
    }
    .fancy .medium {
      font-size: 16px;
      padding-bottom: 8px;
    }
    .pink {
      --paper-card-header-color: var(--paper-pink-500);
    }
  </style>
</head>
<h1>Mosca Morta</h1>
<h2>Fly killing tracker and achievements board<h2>

<div id="cards">
    <paper-card heading="Grand Total" class="pink">
    <div class="card-content">
    {{deaths}} dead flies
    </div>
    <div class="card-actions">
        <paper-button>I killed a fly</paper-button>
    </div>
    <div class="card-actions">
        <paper-button>I killed 5x</paper-button>
        <paper-button>10x</paper-button>
    </div>
    </paper-card>
    <paper-card heading="Leaderboard">
    <div class="card-content leaderboard">
        <paper-item>Lucy<paper-badge label="7"></paper-badge></paper-item>
        <paper-item>Jack<paper-badge label="3"></paper-badge></paper-item>
    </div>
    </paper-card>
    <paper-card>
    <div class="card-content">
    <form action="/kill">
        <button type="submit">I killed a fly</button>
    </form>
    </div>
    </paper-card>
</div>

</html>