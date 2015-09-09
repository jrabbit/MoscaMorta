<!DOCTYPE html>
<html>
<head>
<link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
<link rel="import" href="bower_components/polymer/polymer.html">
<link rel="import" href="bower_components/paper-card/paper-card.html">
<link rel="import" href="bower_components/paper-button/paper-button.html">
<link rel="import" href="bower_components/paper-badge/paper-badge.html">
<link rel="import" href="bower_components/iron-icons/iron-icons.html">
<link rel="import" href="bower_components/paper-input/paper-input.html">
<link rel="import" href="bower_components/paper-icon-button/paper-icon-button.html">
<link rel="import" href="bower_components/ajax-form/ajax-form.html">
<link rel="import" href="bower_components/iron-list/iron-list.html">
<link rel="import" href="bower_components/iron-ajax/iron-ajax.html">




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
    iron-list{
        height: 300px;
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
        <template is="dom-bind">
        %A, B = '{{', '}}'
          <iron-ajax url="/scoreboard" last-response="{{A}}data{{B}}" auto></iron-ajax>
          <iron-list items="[[data]]" as="item">
            <template>
              <div>
              <paper-item>[[item.name]]<paper-badge label="[[item.score]]"></paper-badge><paper-icon-button icon="add"></paper-icon-button></paper-item>
              </div>
            </template>
          </iron-list>
        </template>
        <paper-item>Lucy<paper-badge label="7"></paper-badge><paper-icon-button icon="add"></paper-icon-button></paper-item>
        <paper-item>Jack<paper-badge label="3"></paper-badge><paper-icon-button icon="add"></paper-icon-button></paper-item>
    </div>
    </paper-card>
    <paper-card heading="Add your victories">
    <div class="card-content">
    <form action="/kill" method="POST">
        <paper-input name="name" label="Name"></paper-input>
        <paper-button raised id="submitButton">I killed a fly</paper-button>
        <button type="submit">I killed a fly</button>
    </form>
    </div>
    </paper-card>
</div>
<script>
   document.getElementById('submitButton').addEventListener('click', function() {
      document.forms[0].submit(); 
   });
</script>
</html>