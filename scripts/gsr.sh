#!/bin/bash

# ============================================
# GPU Screen Recorder - Replay Buffer только
# ============================================

# Настройки
VIDEO_DIR="$HOME/Video/"             # Директория для сохранения
BUFFER_SEC=300                       # Длительность буфера (сек)
FPS=60                               # Частота кадров
QUALITY="high"                       # quality, balanced, performance
AUDIO="default_output|default_input" # default_output, default_input
SOURCE="screen"                      # screen, DP-1, HDMI-1, eDP-1

# Создаем директорию
mkdir -p "$VIDEO_DIR"

# Проверка, запущен ли GPU Screen Recorder
is_recording() {
  pgrep -f "gpu-screen-recorder" >/dev/null
}

# Запуск replay buffer
start_replay() {
  if is_recording; then
    return 1
  fi

  echo "▶️ Запуск replay buffer (${BUFFER_SEC} сек)..."

  notify-send -t 2000 "Replay запущен"
  gpu-screen-recorder \
    -w "$SOURCE" \
    -f "$FPS" \
    -a "$AUDIO" \
    -q "$QUALITY" \
    -r "$BUFFER_SEC" \
    -c mp4 \
    -ro "$VIDEO_DIR" \
    -o "$VIDEO_DIR" &
}

# Сохранение 1 мин
save_replay_a() {
  if ! is_recording; then
    notify-send -t 2000 '❌ Replay Buffer неактивна'
    return 1
  fi

  local filename="~/Video/$(niri msg focused-window | grep 'App ID' | cut -d '"' -f 2)-$(date +%Y-%m-%d_%H-%M).mp4"
  # Сигнал для сохранения буфера
  pkill -SIGRTMIN+3 -f gpu-screen-recorder

  notify-send -t 2000 "Replay 1мин сохранен: $filename"
}

# Сохранение 5 мин
save_replay_b() {
  if ! is_recording; then
    notify-send -t 2000 '❌ Replay Buffer неактивна'
    return 1
  fi

  local filename="~/Video/$(niri msg focused-window | grep 'App ID' | cut -d '"' -f 2)-$(date +%Y-%m-%d_%H-%M-%S).mp4"
  # Сигнал для сохранения буфера
  pkill -SIGRTMIN+4 -f "gpu-screen-recorder"

  notify-send -t 2000 "Replay 5мин сохранен: $filename"
}
# Остановка
stop_replay() {
  if is_recording; then
    pkill -SIGINT -f "gpu-screen-recorder"
    notify-send -t 2000 "Replay остановлен"
  fi
}
restart() {
  stop_replay
  sleep 1
  start_replay
}
# Использование
case "$1" in
start)
  start_replay
  ;;
restart)
  restart
  ;;
savea)
  save_replay_a
  ;;
saveb)
  save_replay_b
  ;;
stop)
  stop_replay
  ;;
*)
  echo "Использование: $0 {start|restart|savea|saveb|stop}"
  echo ""
  echo "  start   - запустить replay buffer"
  echo "  restart - перезапустить"
  echo "  savea   - сохранить 1мин"
  echo "  saveb   - сохранить 5мин"
  echo "  stop    - остановить запись"
  ;;
esac
