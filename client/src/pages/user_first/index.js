import React from 'react';
import ReactDOM from 'react-dom';
import Link from 'umi/link';
import {Card, Carousel, Steps, Collapse, Row, Col, Divider} from 'antd'
import 'antd/dist/antd.css'
import styles from "./index.css"

const { Step } = Steps;
const { Panel } = Collapse;

export default class Carousels extends React.Component{
    render(){
        return (
            <div>
                <Row gutter={16}>
                    <Col className="gutter-row" span={16}>
                        <Carousel>
                            <div className={styles.wrapper}><h3 className={styles.ss}>Ant Motion Banner - React</h3></div>
                            <div className={styles.wrapper}><h3 className={styles.ss}>Ant Motion Banner - Vue</h3></div>
                            <div className={styles.wrapper}><h3 className={styles.ss}>Ant Motion Banner - Angular</h3></div>
                        </Carousel>
                    </Col>
                    <Col span={8}>
                        <Card 
                        title="全部操作/便捷导航">
                            <a href="./contract_list.html">合同</a>
                            <Divider type="vertical" />
                            <a href="./basic-list.html">委托</a>
                        </Card>
                    </Col>
                </Row>
                <br />
                <Row gutter={16}>
                <Col span={16}>
                <Card 
                title="进行中的项目"
                bordered={false}
                extra={<Link to="/welcome">全部项目</Link>}
                >
                <Collapse accordion defaultActiveKey={['1']}>
                    <Panel header="小猪佩奇软件测试" key="1">
                        <Steps current={1}>
                            <Step title="委托" description="这是委托的描述." />
                            <Step title="合同" description="这是合同的描述." />
                            <Step title="测试" description="这是测试的描述." />
                        </Steps>
                    </Panel>
                    <Panel header="飞天小女警糖分分析" key="2">
                        <Steps current={2}>
                            <Step title="委托" description="但是我不知道说啥." />
                            <Step title="合同" description="所以随便写点字." />
                            <Step title="测试" description="反正最后也是组长写." />
                        </Steps>
                    </Panel>
                    <Panel header="论持久战" key="3">
                        <Steps current={3}>
                            <Step title="委托" description="组长咋还不回来." />
                            <Step title="合同" description="组长吃饭吃好久." />
                            <Step title="测试" description="我也想吃饭." />
                        </Steps>
                    </Panel>
                </Collapse>
                </Card>
                </Col>
                </Row>
            </div>
        )
    }
};