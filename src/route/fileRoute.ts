const multer = require('multer');
const xlsx = require('xlsx');

const fileRouter = express.Router();
const upload = multer({ dest: 'uploads/' });

fileRouter.post('/file', upload.single('file'), (req: any, res: any) => {
    if (!req.file) return res.status(400).json({ message: 'no file' });
    const book = xlsx.readFile(req.file.path);
    const sheetName = book.sheetNames[0];
    const sheet = book.sheets[sheetName];
    const history = xlsx.utils.sheet_to_json(sheet);
    const validate = history.filter((chat: any) => {
        return chat.user && chat.message;
    });
    if (validate.length == 0) return res.status(400).json({ message: 'no chat data' });

    res.status(200).json({ message: 'chat history imported ', data: validate })
})