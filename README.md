# Go CRUD API with Gin and PostgreSQL

A RESTful CRUD API built with Go, Gin framework, and PostgreSQL (Neon compatible).

## Features

- ✅ CRUD operations for User entity
- ✅ PostgreSQL/Neon database integration
- ✅ Environment-based configuration
- ✅ GORM for database operations
- ✅ Input validation
- ✅ RESTful API design

## Project Structure

```
go-docker/
├── main.go              # Application entry point
├── database/
│   └── database.go      # Database connection
├── models/
│   └── user.go          # User model
├── handlers/
│   └── user_handler.go  # User CRUD handlers
├── routes/
│   └── routes.go        # API routes
├── .env                 # Environment variables
├── .env.example         # Environment variables template
├── .gitignore           # Git ignore file
└── go.mod               # Go module file
```

## Prerequisites

- Go 1.21 or higher
- PostgreSQL database (local or Neon)

## Setup

1. **Clone the repository** (or navigate to the project directory)

2. **Install dependencies:**

   ```bash
   go mod download
   ```

3. **Configure database:**

   For **Neon Database**:

   - Create a Neon account at https://neon.tech
   - Create a new project
   - Copy the connection string
   - Update `.env` file with your Neon credentials:
     ```
     DB_HOST=your-neon-host.neon.tech
     DB_USER=your-username
     DB_PASSWORD=your-password
     DB_NAME=your-database-name
     DB_PORT=5432
     DB_SSLMODE=require
     ```

   For **Local PostgreSQL**:

   - Install PostgreSQL
   - Create a database
   - Update `.env` file with your local credentials

4. **Run the application:**

   ```bash
   go run main.go
   ```

   The server will start on `http://localhost:8080`

## API Endpoints

### Health Check

- `GET /health` - Check if the server is running

### User CRUD Operations

#### Create User

```bash
POST /api/v1/users
Content-Type: application/json

{
  "name": "John Doe",
  "email": "john@example.com",
  "age": 30
}
```

#### Get All Users

```bash
GET /api/v1/users
```

#### Get Single User

```bash
GET /api/v1/users/:id
```

#### Update User

```bash
PUT /api/v1/users/:id
Content-Type: application/json

{
  "name": "John Updated",
  "email": "john.updated@example.com",
  "age": 31
}
```

#### Delete User

```bash
DELETE /api/v1/users/:id
```

## Example Usage with cURL

**Create a user:**

```bash
curl -X POST http://localhost:8080/api/v1/users \
  -H "Content-Type: application/json" \
  -d '{"name":"Alice","email":"alice@example.com","age":25}'
```

**Get all users:**

```bash
curl http://localhost:8080/api/v1/users
```

**Get user by ID:**

```bash
curl http://localhost:8080/api/v1/users/1
```

**Update user:**

```bash
curl -X PUT http://localhost:8080/api/v1/users/1 \
  -H "Content-Type: application/json" \
  -d '{"name":"Alice Updated","email":"alice.updated@example.com","age":26}'
```

**Delete user:**

```bash
curl -X DELETE http://localhost:8080/api/v1/users/1
```

## Environment Variables

| Variable    | Description       | Example                               |
| ----------- | ----------------- | ------------------------------------- |
| DB_HOST     | Database host     | localhost or your-neon-host.neon.tech |
| DB_USER     | Database user     | postgres                              |
| DB_PASSWORD | Database password | your-password                         |
| DB_NAME     | Database name     | go_crud_db                            |
| DB_PORT     | Database port     | 5432                                  |
| DB_SSLMODE  | SSL mode          | disable (local) or require (Neon)     |
| PORT        | Server port       | 8080                                  |

## User Model

```go
type User struct {
    ID        uint      `json:"id"`
    Name      string    `json:"name"`
    Email     string    `json:"email"`
    Age       int       `json:"age"`
    CreatedAt time.Time `json:"created_at"`
    UpdatedAt time.Time `json:"updated_at"`
}
```

## Technologies Used

- **Go** - Programming language
- **Gin** - Web framework
- **GORM** - ORM library
- **PostgreSQL** - Database
- **godotenv** - Environment variable management

## License

MIT
