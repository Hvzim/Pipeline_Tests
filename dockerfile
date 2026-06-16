FROM python:3.13-slim

WORKDIR /test_main

# Instala o Poetry
RUN pip install poetry

# Copia os arquivos de dependências
COPY pyproject.toml poetry.lock* ./

# Instala as dependências do projeto
RUN poetry config virtualenvs.create false \
    && poetry install --no-root --no-interaction

# Copia o restante da aplicação
COPY . .

# Expõe a porta do FastAPI
EXPOSE 8000

# Inicia a aplicação
CMD ["poetry", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
