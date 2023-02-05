// 게시글 삭제
function remove(id) {
    $.ajax({
        type: "delete",
        url: `/remove/${id}`,
    }).done(res => {
        alert("삭제가 성공하였습니다!")
        console.log("성공")
        location.href = "/";
    }).fail(error => {
        console.log("오류", error);
    });
}

// 게시글 수정
function update(id, event) {
    event.preventDefault();
    let data = $("#postupdate").serialize(); // key=value
    console.log(data);
    $.ajax({
        type: "put",
        url: `/post/update/${id}`,
        data: data,
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        dataType: "json"
    }).done(res => {
        alert("수정이 성공하였습니다!")
        console.log("성공")
        location.href = "/";
    }).fail(error => {
        console.log("오류", error);
        console.log(data);
    });
}