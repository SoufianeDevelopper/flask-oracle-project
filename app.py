from flask import Flask, jsonify
import oracledb
import os

app = Flask(__name__)

# Configuration de la connexion (À adapter selon ta VM 1)
DB_CONFIG = {
    "user": "flask_user",
    "password": "flask_password",
    "dsn": "192.168.119.20:1521/BASEDEV"
}

@app.route('/')
def index():
    try:
        # Connexion en mode "Thin" (pas besoin d'Instant Client)
        conn = oracledb.connect(
            user=DB_CONFIG["user"],
            password=DB_CONFIG["password"],
            dsn=DB_CONFIG["dsn"]
        )
        
        cursor = conn.cursor()
        cursor.execute("SELECT sys_context('USERENV', 'DB_NAME') FROM dual")
        db_name = cursor.fetchone()[0]
        
        cursor.close()
        conn.close()
        
        return jsonify({
            "status": "Success",
            "message": f"hello mahbol Connecté avec succès à la base Oracle : {db_name}",
            "host": "VM-Flask-Server"
        })
    except Exception as e:
        return jsonify({
            "status": "Error",
            "message": str(e)
        }), 500

if __name__ == '__main__':
    # On écoute sur 0.0.0.0 pour que ton Windows puisse accéder à la VM
    app.run(host='0.0.0.0', port=5000, debug=True)