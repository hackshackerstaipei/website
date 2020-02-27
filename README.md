# hackshackers.taipei

Hacks/Hackers Taipei 官方網站.


## 內容編輯

內容採用與網頁源碼分離的設計，獨立儲存在 data/ 目錄中, 格式為 yaml + markdown. Yaml 與 Markdown 格式相當簡單, 可參照後面的說明.


## 建立新活動

欲建立新活動，請至 `data/events` 目錄依活動編號建立一新檔案 ( 例如第 20 次活動則為 20.yaml ), 可以從先前的活動拷貝內容做為樣本。

基本上，我們需要以 yaml 格式建立以下欄位:

 * title - 活動標題
 * no - 活動編號
 * date - 活動日期 ( 例如, 2020/01/20 13:40 ~ 16:10 )
 * place - 活動地點簡稱 ( 例如, RGBA Workshop )
 * location - 活動地點細節. 可使用 markdown 編寫. 例如:
    ```
    Cymking Space ( 台北市南港區南港路三段52號7樓 / 感謝 Cymking Space 提供場地 ) ) 
    ```
 * registerlink - 報名連結
 * brief - 活動短描述 ( 用來做活動小卡 ). markdown 格式.
 * description - 活動長描述 ( 顯示在活動專頁中 ). markdown 格式.
 * agenda - 活動流程與其它資訊. markdown 格式.
 * speaker - 講者列表. 每一個講者都應有以下欄位:
   - name - 講者名稱
   - title - 講者頭銜
   - brief - 講者簡介
   - avatar -
     講者大頭照檔名(不包含路徑與副檔名). 檔案放置在 static/assets/img/avatar/ 目錄下, 以 jpg 格式儲存.
     若省略的話, 預設按 name 來找檔案, 比方說若講者叫「王小明」，則會試圖載入 static/assets/img/avatar/王小明.jpg

可參考 [第一次活動 - 地圖神器 QGIS 實戰](https://github.com/hackshackerstaipei/website/blob/master/data/events/1.yaml) 的 Yaml 檔來對照所需的欄位如何編輯.


## 建立新文章

欲建立新活動，請至 `data/posts` 目錄以預計要使用的網址做檔名建立一新檔案 ( 例如欲使用 `https://hackshackers.taipei/posts/my-first-post/` 做網址則檔名命名為 `my-fist-post.yaml` ). 可以從先前的活動拷貝內容做為樣本。

基本上，我們需要以 yaml 格式建立以下欄位:

 * title - 文章標題
 * author - 文章作者
 * avatar - 作者大頭照檔名(不包含路徑與副檔名). 檔案放置在 static/assets/img/avatar/ 目錄下, 以 jpg 格式儲存.
 * thumb - 文章縮圖網址 ( 完整網址. 圖可 host 在任何地方, 例如imgur )
 * date - 文章發表日期, 例如 2020/01/20
 * brief - 文章摘要, 用於顯示文章小卡用. markdown 格式
 * content - 文章全文, 使用 markdown 格式. 若用到任何圖檔, 請自行找地方 host, 例如 imgur.


## Medium To Markdown

現有 Medium 文章可透過工具程式轉換為 Markdown 格式. 請參考:

 * https://medium.com/@macropus/export-your-medium-posts-to-markdown-b5ccc8cb0050


## YAML 格式

Yaml 為一結構化資料格式, 可完全對應 JSON, 但相對容易編輯. 簡單的說, Yaml 檔可包含許多欄位, 各個欄位以 `名稱: 值` 的格式排版. 例如, 下例包含了 `name`, `location` 與 `date` 三個欄位:

    ```
    name: Hacks/Hackers Taipei
    location: Taipei, Taiwan
    date: 2020/01/01
    ```

如果需要的內容超過一行, 可以使用 `|` 符號標明, 並利用縮排指定範圍:

    ```
    name: Hacks/Hackers Taipei
    description: |
      Hacks/Hackers Taipei 是亞洲的 HH 第四站.
      目前主要活動在台北市.
    ```

當我們需要數個相似的物件時, 我們在前面加上一個 `-` 橫線, 並對接下來的內容做縮排. 例如, 下例有三個不同的人:

    ```
    - name: 王小明
      gender: 男
      age: 18
    - name: 王小華
      gender: 男
      age: 19
    - name: 王小萍
      gender: 女
      age: 20
    ```

這個結構可以延伸至各個人的屬性之中, 比方說, 在每個人下面增加一個各包含兩個科目的分數欄位:

    ```
    - name: 王小明
      gender: 男
      score:
        - subject: 國文
          value: 90
        - subject: 英語
          value: 80
    - name: 王小華
      gender: 男
      score:
        - subject: 國文
          value: 70
        - subject: 英語
          value: 58
    ```


## Markdown 格式

Markdown 為一簡易排版語法，其設計使其源碼有一定的可讀性, 同時編寫也相當容易. 一般來說, 當作以純文字寫普通文件即可, 亦可利用線上編輯器生成 markdown ( 例如 [hackmd.io](https://hackmd.io) ).

一些常見的 markdown 語法如下:

 * 標題
   ```
   # 我是標題
   ## 我是子標題
   ```
 * 超連結
   ```
   [我是連結文字](https://link-to-url)
   ```
 * 圖片
   ```
   ![我是圖片說明](https://link-to-img)
   ```
 * 強調
   ```
   **用兩個星號將文字夾住即可**
   ```
 * 引用
   ```
       在文字前面加上四個空白
   ```


亦可參考 [此份 Markdown 文件](https://markdown.tw/).



## License

源碼部份為 MIT, 內容著作權為各作者所有.
