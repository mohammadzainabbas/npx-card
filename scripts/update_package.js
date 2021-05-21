const fs = require("fs").promises

/* Pass down a registry from workflow (in order to set appropriate publish configuration) */
const registry = process.argv[2] || `npm`

/* Pass down repository owner */
const owner = process.argv[3] || `mohammadzainabbas`

fs.readFile("package.json", "utf8")
.then(file => JSON.parse(file))
.then(data => {
    if (registry !== `npm`) {
        data.name = `@${owner}/${data.name}`
        console.log("✅ Updated 'package.json'.")
        return fs.writeFile("package.json", JSON.stringify(data), "utf-8");
    }
})
.catch(err => {console.error("❌ Unable to open 'package.json'."); process.exit(1)})

