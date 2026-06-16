import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["fruity", "dry", "rich", "resultType", "resultTags"]

  connect() {
    this.advise()
  }

  advise() {
    const fruity = parseInt(this.fruityTarget.value)
    const rich = parseInt(this.richTarget.value)
    const dry = parseInt(this.dryTarget.value)

    let typeName = ""
    let typeDesc = "" 
    let recommendedTags = []

    if (fruity >= 4 && rich >= 4) {
      typeName = "熟酒 (じゅくしゅ)"
      typeDesc = "トロリとした完熟感と、奥深く重厚な味わいが特徴の長期熟成タイプです。"
      recommendedTags.push("#熟成", "#コクのある")
    } else if (fruity >= 4 && rich <= 3) {
      typeName = "薫酒 (くんしゅ)"
      typeDesc = "華やかな香りと、サラリとした軽快な味わいが特徴のフルーティなタイプです。"
      recommendedTags.push("#フルーティ", "#華やか", "#爽やか")
    } else if (fruity <= 3 && rich >= 4) {
      typeName = "醇酒 (じゅんしゅ)"
      typeDesc = "お米本来の豊かなコクと旨味がしっかり感じられる、ふくよかなタイプです。"
      recommendedTags.push("#コクのある", "#ふくよか")
    } else if (fruity <= 3 && rich <= 2) {
      typeName = "爽酒 (そうしゅ)"
      typeDesc = "香りは控えめで、サラリとしてキレがある、最もスッキリとしたタイプです。"
      recommendedTags.push("#スッキリ", "#軽快", "#爽やか", "#飲みやすい")
    } else {
      typeName = "バランス型"
      typeDesc = "香りと味わいのバランスが良く、どんなお料理にも合わせやすい万能タイプです。"
      recommendedTags.push("#スッキリ", "#爽やか", "#飲みやすい")
    }

    if (dry >= 4) {
      recommendedTags.push("#スッキリ", "#飲みやすい")
    }

    const uniqueTags = [...new Set(recommendedTags)]

    this.resultTypeTarget.innerHTML = `
      <div class="p-3 mb-3" style="border: 1px solid #b3d7ff; background-color: #e7f1ff; border-radius: 8px;">
        <h6 class="fw-bold text-center mb-2"> オススメの日本酒タイプ</h6>
        <h5 class="fw-bold text-center mb-2">${typeName}</h5>
        <p class="mb-0 small text-muted text-center">${typeDesc}</p>
      </div>
    `

    this.resultTagsTarget.innerHTML = uniqueTags
      .map(tag => `<span class="badge" style="background-color: #d1ccc0; color: #4a4a4a; border-radius: 20px; padding: 0.6em 1.5em; font-size: 0.95rem; font-weight: normal; margin: 4px;">${tag}</span>`)
      .join("")

  }
}
