const jwt = require('jsonwebtoken');
const expToken = require('express');
const tokenRouter = expToken.Router();

const secret = "";
tokenRouter.post('/auth/login', (req: any, res: any) => {
    const { name, password } = req.body;
    const token = jwt.sign({ name, password }, secret, { expiresIn: '1h' });
    return res.json({ token });
})