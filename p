# -*- coding: utf-8 -*-
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>音樂播放器 with 旋轉 CD</title>
  <style>
    body {
      font-family: sans-serif;
      text-align: center;
      background-color: #f0f0f0;
      padding: 50px;
    }

    #cd {
      width: 200px;
      height: 200px;
      margin: 20px auto;
      border-radius: 50%;
      background-image: url('https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/CD_icon.svg/512px-CD_icon.svg.png');
      background-size: cover;
      animation: spin 4s linear infinite;
      animation-play-state: paused;
    }

    @keyframes spin {
      from { transform: rotate(0deg); }
      to   { transform: rotate(360deg); }
    }

    input[type="file"] {
      margin-top: 20px;
    }

    audio {
      margin-top: 20px;
      width: 100%;
      max-width: 400px;
    }
  </style>
</head>
<body>
  <h1>🎵 CD 音樂播放器</h1>
  <div id="cd"></div>
  <input type="file" id="fileInput" accept="audio/*">
  <br>
  <audio id="audio" controls></audio>

  <script>
    const fileInput = document.getElementById('fileInput');
    const audio = document.getElementById('audio');
    const cd = document.getElementById('cd');

    fileInput.addEventListener('change', function () {
      const file = this.files[0];
      if (file) {
        const url = URL.createObjectURL(file);
        audio.src = url;
        audio.load();
      }
    });

    audio.addEventListener('play', () => {
      cd.style.animationPlayState = 'running';
    });

    audio.addEventListener('pause', () => {
      cd.style.animationPlayState = 'paused';
    });

    audio.addEventListener('ended', () => {
      cd.style.animationPlayState = 'paused';
    });
  </script>
</body>
</html
