import {Card ,Breadcrumb ,Button ,Descriptions,Form, Input, Popover, Affix, Divider} from 'antd';
import React , {Component} from 'react';
import {connect} from "dva";
import { FormattedMessage,formatMessage } from 'umi/locale';
import {getRole} from "../../../utils/cookieUtils";
import style from './style.less';

const namespace='contractDetail';
const FormItem = Form.Item;

const mapStateToProps = (state) => {
  const dataCheck = state[namespace];
  //console.log("============datacheck===========")
  console.log("输出合同详情的dataCheck",dataCheck);
  //console.log("输出length",typeof dataCheck.check._links == "undefined")
  //console.log("!!!!!!!!!!!!!!!!!!!!!!!!!!!")
  return {
    dataCheck,
  };
};

@Form.create()
@connect(mapStateToProps)
export default class Detail extends Component{
  constructor(props){
    super(props)
    this.state={
      pid:"",
      comment:""
    }
  }

  componentDidMount() {
    const {dispatch} = this.props;
    if(this.props.location.query.comment){
      this.state.comment=this.props.location.query.comment
    }else{
      this.state.comment=this.props.dataCheck.check.comment
    }
    dispatch({
      type: 'contractDetail/queryGetOneContract',
      payload: this.props.location.query,
    });
  }
  
  review=(form,operation)=> {
    const {dispatch} = this.props;
    this.state.pid = this.props.dataCheck.check.pid;
    // console.log("----------------------------");
    // console.log(this.state.pid);
    // console.log("----------------------------");
    //this.state.comment = this.props.dataCheck.check.comment;
    this.state.comment = this.props.dataCheck.check.comment;
    // console.log("----------------------------");
    // console.log(this.props.dataCheck.check.comment);
    // console.log("----------------------------");
    form.validateFields((err, value)=> {
      var concheck=this.props.dataCheck.check
      concheck.operation=operation
      concheck.comment=value.comment
      // console.log("==========================")
      console.log(concheck.comment)
      // console.log("====================")
      dispatch({
        type: `${namespace}/UpdateProcess`,
        payload: concheck
      });
    })
  }

  render() {
    const {
      form: {getFieldDecorator, getFielValue},
    } = this.props;

    return (
      <div>
        <Breadcrumb>
          <Breadcrumb.Item href="/welcome.html">主页</Breadcrumb.Item>
          <Breadcrumb.Item href="/contract_list.html">合同列表</Breadcrumb.Item>
          <Breadcrumb.Item>合同详情</Breadcrumb.Item>
        </Breadcrumb>
        <br />
        <Card>
          <h2>软件委托测试合同</h2>
        </Card>
        <Card>
          <p>项目名称：<FormattedMessage id={this.props.dataCheck.check.projectName || ' '}/></p>
          <p>委托方（甲方）：<FormattedMessage id={this.props.dataCheck.check.client || ' '}/></p>
          <p>受托方（乙方）: <FormattedMessage id={this.props.dataCheck.check.assignee || ' '}/></p>
          <p>签订地点：<FormattedMessage id={this.props.dataCheck.check.signPlace || ' '}/></p>
          <p>签订日期：<FormattedMessage id={this.props.dataCheck.check.signDate || ' '}/></p>
        </Card>
        <Card>
          <p>本合同由作为委托方的_<FormattedMessage id={this.props.dataCheck.check.client || ' '}/>_(以下简称“甲方”)与作为受托方的南京大学计算机软件新技术国家重点实验室（以下简称“乙方”）在平等自愿的基础上，依据《中华人民共和国合同法》有关规定就项目的执行，经友好协商后订立</p>
          <Divider />
          <h2>一、任务表述</h2>
          <p>乙方按照国家软件测试标准和测试规范，完成甲方委托的软件_<FormattedMessage id={this.props.dataCheck.check.softwareName || ' '}/>_（下称受测软件）的质量特性_<FormattedMessage id={this.props.dataCheck.check.quality || ' '}/>_进行测试，并出具相应的测试报告</p>
          <Divider />
          <h2>二、双方的主要义务</h2>
          <div>1.甲方的主要义务</div>
          <div>（1）	按照合同约定支付所有费用。</div>
          <div>（2）	按照乙方要求以书面形式出具测试需求，包括测试子特性、测试软硬件环境等。</div>
          <div>（3）	提供符合交付要求的受测软件产品及相关文档，包括软件功能列表、需求分析、设计文档、用户文档至乙方。</div>
          <div>（4）	指派专人配合乙方测试工作，并提供必要的技术培训和技术协助。</div>
          <br />
          <div>2.乙方的主要义务</div>
          <div>（1）	设计测试用例，制定和实施产品测试方案。</div>
          <div>（2）	在测试过程中，定期知会甲方受测软件在测试过程中出现的问题。</div>
          <div>（3）	按期完成甲方委托的软件测试工作</div>
          <div>（4）	出具正式的测试报告</div>
          <Divider />
          <h2>三、履约地点</h2>
          <div>由甲方将受测软件产品送到乙方实施测试。如果由于被测软件本身特点或其它乙方认可的原因，需要在甲方所在地进行测试时，甲方应负担乙方现场测试人员的差旅和食宿费用。</div>
          <Divider />
          <h2>四、合同价款</h2>
          <p>本合同软件测试费用为人民币_<FormattedMessage id={this.props.dataCheck.check.price || ' '}/>_(¥_<FormattedMessage id={this.props.dataCheck.check.price || ' '}/>_元)。</p>
          <Divider />
          <h2>五、测试费用支付方式</h2>
          <div>本合同签订后，十个工作日内甲方合同价款至乙方账户。</div>
          <Divider />
          <h2>六、履行的期限</h2>
          <div>1.本次测试的履行期限为合同生效之日起_<FormattedMessage id={this.props.dataCheck.check.finishTime || ' '}/>_个自然日内完成。</div>
          <div>2.经甲乙双方同意，可对测试进度作适当修改，并以修改后的测试进度作为本合同执行的期限。</div>
          <div>3.如受测软件在测试过程中出现的问题，导致继续进行测试会影响整体测试进度，则乙方暂停测试并以书面形式通知甲方进行整改。在整个测试过程中，整改次数限于_<FormattedMessage id={this.props.dataCheck.check.modifyNum || ' '}/>_次，每次不超过_<FormattedMessage id={this.props.dataCheck.check.modifyTime || ' '}/>_天。</div>
          <div>4.如因甲方原因，导致测试进度延迟、应由甲方负责，乙方不承担责任。</div>
          <div>5.如因乙方原因，导致测试进度延迟，则甲方可酌情提出赔偿要求，赔偿金额不超过甲方已付金额的50%。双方经协商一致后另行签订书面协议，作为本合同的补充。</div>
          <Divider />
          <h2>七、资料的保密</h2>
          <div>对于一方向另一方提供使用的秘密信息，另一方负有保密的责任，不得向任何第三方透露。为明确双方的保密义务，双方应签署《软件项目委托测试保密协议》，并保证切实遵守其中条款。</div>
          <Divider />
          <h2>八、风险责任的承担</h2>
          <div>乙方人员在本协议有效期间（包括可能的到甲方出差）发生人身意外或罹患疾病时由乙方负责处理。甲方人员在本协议有效期间（包括可能的到乙方出差）发生人身意外或罹患疾病时由甲方负责处理。</div>
          <Divider />
          <h2>九、验收方法</h2>
          <div>由乙方向甲方提交软件产品鉴定测试报告正本一份，甲方签订鉴定测试报告后，完成验收。</div>
          <Divider />
          <h2>十、争议解决</h2>
          <div>双方因履行本合同所发生的一切争议，应通过友好协商解决；如协商解决不成，就提交市级仲裁委员会进行仲裁。裁决对双方当事人具有同等约束力。</div>
          <Divider />
          <h2>十一、其他</h2>
          <div>本合同自双方授权代表签字盖章之日起生效，自受托方的主要义务履行完毕之日起终止。</div>
          <div>本合同未尽事宜有双方协商解决。</div>
          <div>本合同的正本一式肆份，双方各执两份，具有同等法律效力。</div>
          <Divider />
          <h2>十二、签章</h2>
          <p>委托方--单位全称：<FormattedMessage id={this.props.dataCheck.check.clientCompanyName || ' '}/></p>
          <p>委托方--授权代表：<FormattedMessage id={this.props.dataCheck.check.clientAuthRepre || ' '}/></p>
          <p>委托方--签章日期：<FormattedMessage id={this.props.dataCheck.check.clientSignDate || ' '}/></p>
          <p>委托方--联系人：<FormattedMessage id={this.props.dataCheck.check.clientContact || ' '}/></p>
          <p>委托方--通讯地址：<FormattedMessage id={this.props.dataCheck.check.clientAddr || ' '}/></p>
          <p>委托方--电话：<FormattedMessage id={this.props.dataCheck.check.clientTel || ' '}/></p>
          <p>委托方--传真：<FormattedMessage id={this.props.dataCheck.check.clientFax || ' '}/></p>
          <p>委托方--开户银行：<FormattedMessage id={this.props.dataCheck.check.clientBank || ' '}/></p>
          <p>委托方--账号：<FormattedMessage id={this.props.dataCheck.check.clientUserName || ' '}/></p>
          <p>委托方--邮编：<FormattedMessage id={this.props.dataCheck.check.clientPostCode || ' '}/></p>
          <p>受托方--单位全称：<FormattedMessage id={this.props.dataCheck.check.assigneeCompanyName || ' '}/></p>
          <p>受托方--授权代表：<FormattedMessage id={this.props.dataCheck.check.assigneeAuthRepre || ' '}/></p>
          <p>受托方--签章日期：<FormattedMessage id={this.props.dataCheck.check.assigneeSignDate || ' '}/></p>
          <p>受托方--联系人：<FormattedMessage id={this.props.dataCheck.check.assigneeContact || ' '}/></p>
          <p>受托方--通讯地址：<FormattedMessage id={this.props.dataCheck.check.assigneeAddr || ' '}/></p>
          <p>受托方--邮编：<FormattedMessage id={this.props.dataCheck.check.assigneePostCode || ' '}/></p>
          <p>受托方--电话：<FormattedMessage id={this.props.dataCheck.check.assigneeTel || ' '}/></p>
          <p>受托方--传真：<FormattedMessage id={this.props.dataCheck.check.assigneeFax || ' '}/></p>
          <p>受托方--开户银行：<FormattedMessage id={this.props.dataCheck.check.assigneeBank || ' '}/></p>
          <p>受托方--账号：<FormattedMessage id={this.props.dataCheck.check.assigneeUserName || ' '}/></p>
        </Card>
        <br />
        {
          {
            "SM":
            <div>
              <h1>市场部主任</h1>
              <FormItem label={<FormattedMessage id=" 审批意见"/>}>
                {getFieldDecorator('comment', {
                  initialValue: this.props.dataCheck.check.comment || "",
                },{
                  rules: [
                  {
                    required: true,
                    message: formatMessage({id: "需要审批意见"}),
                  },
                ],
                })(<Input placeholder={formatMessage({id: "输入审批意见"})} 
                //当processState是review 并且 checked=0 的时候是可编辑的
                disabled={this.props.dataCheck.check.processState!="Review" || this.props.dataCheck.checked == 1 }
                />)}
              </FormItem>
              <Affix offsetBottom={0} >
              <div>
              {
                //当状态是Review，并且checked=0的时候出现按钮，否则隐藏
                this.props.dataCheck.check.processState=="Review" && this.props.dataCheck.checked == 0?(
                <div className={style.submitBtns}>
                  <Button onClick={() => {
                    this.review(this.props.form,"ReviewPass")
                  }}
                  style={{marginLeft: 50}}
                  type="primary">
                    <FormattedMessage id="同意" />
                  </Button>
                  <Popover content="不同意会让合同重新编辑，不会影响委托" title="注意">
                  <Button onClick={() => {
                    this.review(this.props.form,"ReviewDisprove")
                  }}
                  style={{marginLeft: 20}}
                  >
                    <FormattedMessage id="不同意" />
                  </Button>
                  </Popover>
                </div>)
                :null
              }
              </div>
              </Affix>
            </div>,

            "CUS":
            <div >
              <Descriptions title="客户">
                <Descriptions.Item label="委托状态">{this.props.dataCheck.check.processState || ' '}</Descriptions.Item>
                <Descriptions.Item label="委托意见">{this.props.dataCheck.check.comment || ''}</Descriptions.Item>
              </Descriptions>
              <Affix offsetBottom={0} >
              <div>
              {
                //当状态是Review的时候出现按钮，否则隐藏
                this.props.dataCheck.check.processState=="Review"?
                <div className={style.submitBtns}>
                  <Button onClick={() => {
                    this.review(this.props.form,"ReviewPass")
                  }}
                  style={{marginLeft: 50}}
                  type="primary">
                    <FormattedMessage id="确认" />
                  </Button>
                  <Button onClick={() => {
                    this.review(this.props.form,"ReviewDisprove")
                  }}
                  style={{marginLeft: 20}}
                  >
                    <FormattedMessage id="拒绝" />
                  </Button>
                </div>
                :null
              }
              </div>
              </Affix>
            </div>,

            "SS":
            <div>
               
            </div>,

            "QM":
            <div>
              <h1>  质量部主任</h1>
              <FormItem label={<FormattedMessage id=" 审批意见"/>}>
                {getFieldDecorator('comment', {
                  initialValue: this.props.dataCheck.check.comment || "",
                },{
                  rules: [
                  {
                    required: true,
                    message: formatMessage({id: "需要审批意见"}),
                  },
                ],
                })(<Input placeholder={formatMessage({id: "输入审批意见"})} 
                //当processState是review的时候是可编辑的
                disabled={this.props.dataCheck.check.processState!="Review" || this.props.dataCheck.checked == 1}
                />)}
              </FormItem>
              <Affix offsetBottom={0} >
              <div>
              {
                //当状态是Review的时候出现按钮，否则隐藏
                this.props.dataCheck.check.processState=="Review" && this.props.dataCheck.checked == 0?
                <div className={style.submitBtns}>
                  <Button onClick={() => {
                    this.review(this.props.form,"ReviewPass")
                  }}
                  style={{marginLeft: 50}}
                  type="primary">
                    <FormattedMessage id="同意" />
                  </Button>
                  <Button onClick={() => {
                    this.review(this.props.form,"ReviewDisprove")
                  }}
                  style={{marginLeft: 20}}>
                    <FormattedMessage id="不同意" />
                  </Button>
                </div>
                :null
              }
              </div>
              </Affix>
            </div>,
          }[getRole()[0]]
        }

      </div>
    )
  }
};
