<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script type="module">
    const {autocomplete} = window['@algolia/autocomplete-js'];


    autocomplete({
        container: '#autocomplete',
        placeholder: 'Tìm kiếm',
        insights: true,
        getSources() {
            return [
                {
                    sourceId: 'users',
                    async getItems({query}) {
                        const res = await fetch(`${pageContext.request.contextPath}/api/friends?q=\${query}`);
                        const data = await res.json();
                        console.log(data);
                        return data;
                    },
                    getItemUrl({item}) {
                        return `${pageContext.request.contextPath}/users/profile?id=\${item.id}`;
                    },
                    templates: {
                        header({items, html}) {
                            if (items.length === 0) {
                                return null;
                            }

                            return html`<span class="aa-SourceHeaderTitle">Bạn bè</span>
                            <div class="aa-SourceHeaderLine"/>`;
                        },
                        item({item, components, html}) {
                            const url = `${pageContext.request.contextPath}/users/profile?id=\${item.id}`;
                            let imageUrl = `\${item.avatarImage.image.url}`;
                            if (!imageUrl.includes("https")) {
                                imageUrl = "${pageContext.request.contextPath}/" + imageUrl;
                            }
                            return html`
                                <a class="aa-ItemWrapper text-decoration-none" href="\${url}">
                                    <div class="aa-ItemContent">
                                        <div style="width: 40px; height: 40px;">
                                            <img
                                                    class="img-fluid rounded-circle"
                                                    width="40" height="40" alt=""
                                                    src="\${imageUrl}"
                                            />
                                        </div>
                                        <div class="aa-ItemContentBody">
                                            <div class="aa-ItemContentTitle">
                                                \${components.Highlight({
                                                hit: item,
                                                attribute: 'username',
                                                })}
                                            </div>
                                            <div class="aa-ItemContentDescription">
                                                Bạn bè
                                                \${components.Snippet({
                                                hit: item,
                                                attribute: 'description',
                                                })}
                                            </div>
                                        </div>
                                    </div>
                                </a>`;
                        },
                    },
                },
            ];
        },
    });
</script>