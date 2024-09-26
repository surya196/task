const exp = require('express');
const bcrypt = require('bcryptjs');

const router = express.Router();
const users: any[] = [];

router.post('/register', async (req: any, res: any) => {
    const { name, password } = req.body;

    if (!name || !password) {
        return res.status(400).json({ message: 'name and password are required' })
    }
    const existingUser = users.find(user => user.name === name);
    if (existingUser) {
        return res.status(400).json({ message: 'user alreay exists' });
    }
    const hashPassword = await bcrypt.hash(password, 10);
    const newUser = { name, password: hashPassword }
    users.push(newUser);
    res.status(201).json({ message: 'user registered' });
})