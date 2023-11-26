# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin "@fullcalendar/core", to: "https://ga.jspm.io/npm:@fullcalendar/core@6.1.9/index.js"
pin "preact", to: "https://ga.jspm.io/npm:preact@10.12.1/dist/preact.module.js"
pin "preact/compat", to: "https://ga.jspm.io/npm:preact@10.12.1/compat/dist/compat.module.js"
pin "preact/hooks", to: "https://ga.jspm.io/npm:preact@10.12.1/hooks/dist/hooks.module.js"
pin "@fullcalendar/daygrid", to: "https://ga.jspm.io/npm:@fullcalendar/daygrid@6.1.9/index.js"
pin "@fullcalendar/core/", to: "https://ga.jspm.io/npm:@fullcalendar/core@6.1.9/"
pin "@fullcalendar/interaction", to: "https://ga.jspm.io/npm:@fullcalendar/interaction@6.1.9/index.js"
pin "@fullcalendar/list", to: "https://ga.jspm.io/npm:@fullcalendar/list@6.1.9/index.js"
pin "@fullcalendar/timegrid", to: "https://ga.jspm.io/npm:@fullcalendar/timegrid@6.1.9/index.js"
pin "@fullcalendar/daygrid/internal.js", to: "https://ga.jspm.io/npm:@fullcalendar/daygrid@6.1.9/internal.js"
pin "@rails/request.js", to: "https://cdn.skypack.dev/@rails/request.js@latest", preload: true
pin "stimulus-autocomplete", to: "https://ga.jspm.io/npm:stimulus-autocomplete@3.1.0/src/autocomplete.js", preload: true