FROM golang:1.18

WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY *.go ./
RUN go get github.com/rbh-interview-system/src
RUN go get github.com/rbh-interview-system/src/model
RUN go get github.com/rbh-interview-system/src/repository
RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-gs-ping


EXPOSE 8080

CMD ["/docker-gs-ping"]