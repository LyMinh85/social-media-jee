// Replace with your own values
const searchClient = algoliasearch(
    'YP9N3L5T3I',
    '89ebc2941f2dabfc380ab0e3fa36311e' // search only API key, not admin API key
)

const search = instantsearch({
    indexName: 'contacts',
    searchClient,
    routing: true,
})



search.addWidgets([
    instantsearch.widgets.configure({
        hitsPerPage: 10,
    }),
])

search.addWidgets([
    instantsearch.widgets.searchBox({
        container: '#search-box',
        placeholder: 'Search for contacts',
    }),
])

search.addWidgets([
    instantsearch.widgets.hits({
        container: '#hits',
        templates: {
            item: document.getElementById('hit-template').innerHTML,
            empty: `We didn't find any results for the search <em>"{{query}}"</em>`,
        },
    }),
])

autocomplete({
    search,
})

search.start()
