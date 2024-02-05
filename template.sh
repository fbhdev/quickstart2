function create_response_template {
  touch template.py
  echo "
class Template:

    """"""
    @staticmethod
    def generate(status: int, results: list = None, message: str = None) -> dict:
        """"""
        return {
            'status': status,
            'results': results,
            'message': message
        }
  " >>template.py
}

cd server || exit
create_response_template
cd ../ || exit