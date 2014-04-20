<div><img src="/uploads/avatars/<?=$user_info['avatar']?>"><div>

        <div>
            <form action="/profile/avatar" method="POST" enctype="multipart/form-data">
                <input type="file" name="avatar">
                <input type="submit">
                
            </form>
        </div>