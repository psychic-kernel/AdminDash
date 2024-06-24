
const SignInView = () => {


    const handleSubmit = async(event) => {
        event.preventDefault();

        const [credentials, setCredentials] = useState([
            {
                email: 'test@mail.com',
                password: 'password',
                passwordConfirm: 'password'
            }
        ])

        const data = new FormData(event.target);
        const email = data.get('email');
        const password = data.get('password');

        await fetch('http://localhost:3000/api/v1/auth/signin', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ email, password })
        })
            .then(response => response.json())
            .then(data => {
                if (data.error) {
                    alert(data.error);
                } else {
                    localStorage.setItem('token', data.token);
                    window.location.replace('/dashboard');
                }
            })
            .catch(error => {
                console.error('Error:', error);
            });
    }

    return (
        <main>
            <form onSubmit={handleSubmit}>
                <div className="mb-3">
                    <label htmlFor="email" className="form-label">Email address</label>
                    <input type="email" className="form-control" id="email" name="email" required />
                </div>
                <div className="mb-3">
                    <label htmlFor="password" className="form-label">Password</label>
                    {credentials.map((credential, index) => {
                        return (
                            <div key={index}>
                                <input type="password" className="form-control" id="password" name="password" required
                                    value={credential.password} />
                                <input type="passwordConfirm" className="form-control" id="passwordConfirm" name="passwordConfirm" placeholder="re-enter to confirm password" required 
                                    value={credential.confirm}/>
                            </div>
                        )
                    }
                    )}
                </div>
                <button type="submit" className="btn btn-primary">Sign In</button>
            </form>
        </main>
    )
}; export default SignInView;