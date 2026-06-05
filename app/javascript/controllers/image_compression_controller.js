import { Controller } from "@hotwired/stimulus"
import imageCompression from "browser-image-compression"

export default class extends Controller {
  static targets = ["input"]

  async compress(event) {
    const fileInput = event.target
    const files = fileInput.files

    if (!files || files.length === 0) return

    const options = {
      maxSizeMB: 1, 
      maxWidthOrHeight: 1200,
      useWebWorker: true
    }

    try {
      const DataTransferObj = new DataTransfer()

      for (let i = 0; i < files.length; i++) {
        const file = files[i]

        if (file.size / 1024 / 1024 < options.maxSizeMB) {
          DataTransferObj.items.add(file)
          continue
        }

        const compressedFile = await imageCompression(file, options)

        const newFile = new File([compressedFile], file.name, {
          type: compressedFile.type,
          lastModified: Date.now()
        })
        
        DataTransferObj.items.add(newFile)
      }

      fileInput.files = DataTransferObj.files

    } catch (error) {
      console.error("画像の圧縮に失敗しました:", error)
    }
  }
}