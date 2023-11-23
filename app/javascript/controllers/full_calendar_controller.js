import { Controller } from "@hotwired/stimulus"
import { Calendar } from "@fullcalendar/core"
import dayGridPlugin from "@fullcalendar/daygrid"
import interactionPlugin from "@fullcalendar/interaction"
import listPlugin from "@fullcalendar/list"
import timeGridPlugin from "@fullcalendar/timegrid"



// フルカレンダーのCSSをインポートする必要がある場合は、以下のように追加する
// import "@fullcalendar/core/main.css"
// import "@fullcalendar/daygrid/main.css"

export default class extends Controller {
  connect() {
    var calendarEl = this.element
    var calendar = new Calendar(calendarEl, {
      plugins: [ dayGridPlugin, interactionPlugin, listPlugin, timeGridPlugin ],
      initialView: 'dayGridMonth',
      // ここにイベントデータを取得するロジックなどを追加
    })
    calendar.render()
  }
}