root = document.getElementById('root')
inp = document.getElementById('inp')
bt = document.getElementById('bt')

lista = [];

getLocal = ->
    store = localStorage.cards 
    if store
        lista = [...JSON.parse(store)]
    else
        localStorage.cards = "";
        
deldel = ->
    console.log "asd"

create = -> 
    # clear inner
    root.innerHTML = "";

    # set new inner
    for i of lista
        el = document.createElement 'div'
        el.innerText = lista[i]
        el.className = "card"

        btel = document.createElement 'button'
        btel.dataset.id = i 
        btel.innerText = 'x'
        btel.addEventListener 'click', (e) ->
            lista.splice e.path[0].dataset.id, 1;
            localStorage.cards = JSON.stringify(lista);
            create();
        el.append btel
        root.append el
        inp.value = "";

getLocal();create();

bt.onclick = -> 
    val = inp.value.replace /^\s+|\s+$/g, ""
    if val != ''
        lista.unshift [val]
        localStorage.cards = JSON.stringify(lista);
        create()
