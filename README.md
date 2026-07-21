# 银河互联网电视 - 静态网站部署包

## 简介
本包是「银河互联网电视」产品展示网站的构建产物，包含所有静态资源（HTML、CSS、JS、图片），可直接部署到任何静态文件服务器上。

## 部署方式

### 方式一：上传到静态托管平台（推荐，免费）
1. 打开 [Netlify Drop](https://app.netlify.com/drop/) 或 [Vercel](https://vercel.com/import)
2. 将本文件夹（或其中的 `index.html` 所在目录）拖入网页
3. 等待几秒，即可获得一个公网链接

### 方式二：部署到自己的服务器
将本文件夹中所有文件上传到服务器任意目录，使用 Nginx / Apache 等指向该目录即可。

### 方式三：本地预览
在终端中运行以下命令：
```bash
# 方式 A：使用 Python（无需安装额外工具）
python3 -m http.server 8080

# 方式 B：使用 Node.js 的 serve
npx serve . -l 8080
```
然后在浏览器访问 `http://localhost:8080`。

## 文件结构
```
├── index.html          # 入口页面
├── assets/             # 编译后的 JS 和 CSS
├── favicon.svg         # 网站图标
├── logo.png            # Logo
├── china-map.json      # 中国地图数据
├── ad-images/          # 广告产品图片
├── agent-images/       # 智能体产品图片
├── ainews-images/      # AI 资讯图片
├── logos/              # 合作伙伴 Logo
├── tianguang-images/   # 天光产品图片
└── 银河大数据平台_files/  # 大数据平台页面资源
```

## 注意事项
- 本包为**纯静态文件**，无需后端环境
- 请勿直接双击 `index.html` 打开（部分浏览器会因安全策略限制导致空白），请使用 HTTP 服务访问
- 部署到生产环境时，建议开启 Gzip 压缩和缓存策略以优化加载速度