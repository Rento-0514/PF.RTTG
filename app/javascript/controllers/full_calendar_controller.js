import { Controller } from "@hotwired/stimulus"
import { Calendar } from '@fullcalendar/core'
import dayGridPlugin from '@fullcalendar/daygrid'
import interactionPlugin from '@fullcalendar/interaction'
import listPlugin from '@fullcalendar/list'
import timeGridPlugin from '@fullcalendar/timegrid'

export default class extends Controller {
  connect() {
    var calendarEl = this.element
    var calendar = new Calendar(calendarEl, {
      plugins: [ dayGridPlugin, interactionPlugin, listPlugin, timeGridPlugin ],
      initialView: 'dayGridMonth',
      dateClick: function(info) {
        // ここで予約作成画面へのパスを指定する
        window.location.href = '/reservation_requests/new?date=' + info.dateStr; 
      },
      eventClick: function(info) {
        window.location.href = info.event.url; // URLに遷移する
      },
      events: '/reservation_requests.json' // サーバーからイベントデータを取得する
    })
    calendar.render()
  }
}